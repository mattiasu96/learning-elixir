# exs are intended for scripting and will stay in memory.
# ex are compiled and written to disk in a beam file.

defmodule ModulePlayground do # defmodule is a macro, not a keyword
    import IO, only: [puts: 1] # This "only" id done to import only a specific part of the library. The number is the herity (?)
    import Kernel, except: [inspect: 1] # This is a default library I am exluding to avoid conflicts with my inspect function!

    def say_here do
      inspect "I'm Here"
    end

    def inspect(param1) do
      puts "Starting Output"
      puts param1
      puts "Ending Output "
    end

    def print_sum do
      ModulePlayground.Misc.Util.Math.add(1,2)
    end

end
