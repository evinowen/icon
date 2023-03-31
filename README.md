```

    _|_|_|     _|_|_|     _|_|_|     _|      _|
      _|     _|         _|      _|   _|_|    _|
      _|     _|         _|      _|   _|  _|  _|
      _|     _|         _|      _|   _|    _|_|
    _|_|_|     _|_|_|     _|_|_|     _|      _|



                   You are ICON
             last defense of Humanity.
              Your vessel a prototype,
         it remains the final opposition
      against the extraterrestrial incursion.
                Emerge victorious
            lest Humanity will perish.

```

Icon is an arcade-style Fixed Shooter action game developed for the original Ninteno Entertainment System (NES).

## Build
To build leverage the Makefile, running `make` in the root directory.

Optionally, and if the `EMULATOR_PATH` is set, run `make && make run` to build and run the game -- `run` assumes the `.rom` can be loaded as the first parameter to the provided emulator, and detaches from the process with `&`.

```
make && make run
```

### cc65
Code leverages ca65 macros, see source and documentation at:
https://github.com/cc65/cc65

### Debug
The build process is designed to output additional detail that can be used for debug purposes -- specifically data for FCEUX is generated
during the build process using a utility script (`./util/gen.fceux.nl.sh`)
