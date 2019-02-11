module ZENATHARK

export path_from_dataset

datasetdir = ""
if "JULIA_DATASET_DIR" in keys(ENV)
    datasetdir = ENV["JULIA_DATASET_DIR"]
end

function path_from_dataset(rpath)
    if isdef(:datasetdir) && datasetdir != ""
        newpath = "$datasetdir/$rpath"
        if isdir(newpath)
            newpath
        else
            error("$rpath doesn't point to a valid directory.")
        end
    else
        error("JULIA_DATASET_DIR environment varible not set, please set it in your shell script.")
    end
end

# Add all the valid projects to the load path
# function loadprojects()
#     env = ENV["JULIASRC"]
#     for path in readdir(env)
#         if isdir("$env/$path")
#             try path_src = readdir("$env/$path/src")
#                 if "$path.jl" in path_src
#                     push!(LOAD_PATH, "$env/$path/src")
#                 end
#             end
#         end
#     end
# end

end


# Main Configuration Starts
using OhMyREPL
# ENV["PYTHON"] = "$(ENV["HOME"])/.pyenv/versions/anaconda3-4.4.0/bin/python"
# ZENATHARK.loadprojects()
