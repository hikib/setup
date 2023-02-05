# IfcOpenShell image
Used to run python scripts with [IfcOpenShell](https://github.com/ifcopenshell/ifcopenshell).

Still in testing!

## Example: Merging IFC files
I want to merge `haus.ifc` with `maus.ifc`.
Based on `ifcpatch` scripts within IfcOpenShell.

```python
# mergeifc.py
import ifcopenshell
this = ifcopenshell.open("/app/haus.ifc")
other = ifcopenshell.open("/app/maus.ifc")

merged_project = other.add(this.by_type("IfcProject")[0])
for element in source:
    file.add(element)
for inverse in file.get_inverse(merged_project):
    ifcopenshell.util.element.replace_attribute(inverse, merged_project, original_project)
file.remove(merged_project)
```

```bash
# build image
podman build -t ifc .

# run container
# add current directory as volume
# -> including .py and .ifc files
podman run --rm -v ./:/app ifc python ./mergeifc.py
```

Once the image is build, the second part could be part of a
powershell/bash script and added to `PATH`.

### Side note
See [my scripts](https://github.com/hikib/scripts) for similar BIM
scripts with and without containers.

