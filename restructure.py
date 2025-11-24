import os

scad_lines = ["// Auto-generated: only folders named 'Scalable'\n"]

for root, _, files in os.walk("."):
    # Must contain 'Scalable' (case-insensitive) but NOT 'Non-Scalable'
    root_lower = root.lower()
    if "scalable" not in root_lower or "non-scalable" in root_lower:
        continue

    rel_root = os.path.relpath(root, ".").replace("\\", "/")
    stl_files = [f for f in files if f.lower().endswith(".stl")]
    if stl_files:
        scad_lines.append(f"// --- {rel_root} ---")
        for f in stl_files:
            rel_path = os.path.join(rel_root, f).replace("\\", "/")
            scad_lines.append(f'import("{rel_path}", center=true, convexity=10);')
        scad_lines.append("")

with open("import_scalable.scad", "w") as out:
    out.write("\n".join(scad_lines))

print(f"✅ Generated import_scalable.scad with {len(scad_lines)} STL entries.")
