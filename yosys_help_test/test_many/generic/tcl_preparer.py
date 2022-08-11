import sys

def prepare_tcl(file_name, original_text, replacement_text):
    # print("Replacing " + original_text + " with " + replacement_text)
    # Read in the file
    with open(file_name, 'r') as file:
        filedata = file.read()

    # Replace the target string
    filedata = filedata.replace(original_text, replacement_text)

    # Write the file out again
    with open(file_name, 'w') as file:
        file.write(filedata)


if __name__:
    prepare_tcl(sys.argv[1], sys.argv[2], sys.argv[3])
