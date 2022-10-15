# exs are intended for scripting and will stay in memory.
# ex are compiled and written to disk in a beam file.

# Remember that whan I call iex I have to add the name of the exs file

defmodule ModulePlayground do # defmodule is a macro, not a keyword
    import IO, only: [puts: 1] # This "only" id done to import only a specific part of the library. The number is the herity (?)
    import Kernel, except: [inspect: 1] # This is a default library I am exluding to avoid conflicts with my inspect function!


    # Import: Include other module functions. I can include all functions or the ones I need
    # Alias: Basically just rename stuff to make it shorter to declare
    # Require: Allows to use macros (I will see them later)

    alias ModulePlayground.Misc.Util.Math, as: MyMath # I can define an alias for module imports

    require Integer

    def say_here do
      inspect "I'm Here"
    end

    def inspect(param1) do
      puts "Starting Output"
      puts param1
      puts "Ending Output "
    end

    def print_sum do
      MyMath.add(1,2)
    end

    def print_is_even(num) do
      puts "Is #{num} even? #{Integer.is_even(num)}"

    end

end
