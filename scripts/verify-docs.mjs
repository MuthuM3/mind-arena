import fs from "node:fs";
import path from "node:path";

const root = process.cwd();
const excludedDirectories = new Set([".git", "build", "dist", "node_modules"]);
const requiredFiles = [
  "AGENTS.md",
  "README.md",
  "docs/product/vision.md",
  "docs/product/v1-product-requirements.md",
  "docs/product/arena-engine-and-formats.md",
  "docs/product/age-adaptive-experience.md",
  "docs/product/community-trust-safety.md",
  "docs/architecture/system-architecture.md",
  "docs/architecture/ai-privacy-data.md",
  "docs/status/product-execution-program.md",
  "docs/operations/risk-register.md",
];

const failures = [];
const markdownFiles = [];

function walk(directory) {
  for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
    if (entry.isDirectory() && excludedDirectories.has(entry.name)) {
      continue;
    }

    const absolutePath = path.join(directory, entry.name);
    if (entry.isDirectory()) {
      walk(absolutePath);
    } else if (entry.name.endsWith(".md")) {
      markdownFiles.push(absolutePath);
    }
  }
}

for (const relativePath of requiredFiles) {
  if (!fs.existsSync(path.join(root, relativePath))) {
    failures.push(`Missing required authority file: ${relativePath}`);
  }
}

walk(root);

for (const absolutePath of markdownFiles) {
  const relativePath = path.relative(root, absolutePath);
  const content = fs.readFileSync(absolutePath, "utf8");
  const lines = content.split("\n");

  lines.forEach((line, index) => {
    if (/[ \t]+$/.test(line)) {
      failures.push(`${relativePath}:${index + 1} has trailing whitespace`);
    }
    if (line.includes("\0")) {
      failures.push(`${relativePath}:${index + 1} contains a NUL character`);
    }
  });

  for (const match of content.matchAll(/\[[^\]]+\]\(([^)]+)\)/g)) {
    const target = match[1].split("#")[0];
    if (!target || /^[a-z]+:/i.test(target) || target.startsWith("/")) {
      continue;
    }

    const resolvedTarget = path.resolve(path.dirname(absolutePath), target);
    if (!fs.existsSync(resolvedTarget)) {
      failures.push(`${relativePath} has a broken local link: ${match[1]}`);
    }
  }
}

if (failures.length > 0) {
  console.error(failures.join("\n"));
  process.exit(1);
}

console.log(`Documentation verification passed (${markdownFiles.length} Markdown files).`);
