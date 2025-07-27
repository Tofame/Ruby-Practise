### marshal.rb

First file in which I checked basic binary write/read

### people.rb and classes/files related (person...)

Basically I wanted to understand how I would serialize/deserialize data structures.
The important things to note are Ruby 'pack' function.

For example:
pack("CCCCC") + name_bytes + surname_bytes

That means we save 5x uint8_t + bytes of name string (chars) + bytes of surname string (chars)

## Common Ruby `pack` Format Codes

| Code | Meaning                             | Size (bytes)       | Example Use                          |
|-------|-----------------------------------|--------------------|------------------------------------|
| `C`   | Unsigned 8-bit integer (0..255)   | 1                  | For `uint8` fields like `health`, `age` |
| `c`   | Signed 8-bit integer (-128..127)  | 1                  | Signed 8-bit numbers                |
| `S`   | Unsigned 16-bit integer (native endian) | 2           | For `uint16` values                 |
| `s`   | Signed 16-bit integer (native endian)    | 2           | Signed 16-bit                      |
| `L`   | Unsigned 32-bit integer (native endian) | 4           | For larger `uint32` values          |
| `l`   | Signed 32-bit integer (native endian)    | 4           | Signed 32-bit                      |
| `Q`   | Unsigned 64-bit integer (native endian) | 8           | 64-bit integers                    |
| `A`   | ASCII string (space padded)       | N (specified)      | Fixed-width ASCII strings           |
| `a`   | ASCII string (null padded)        | N (specified)      | Fixed-width ASCII strings           |
| `Z`   | Null-terminated string            | Variable           | Null-terminated string              |

---

### Notes:
- Use `"C"` for storing unsigned 8-bit integers.
- Strings are usually appended raw after packing fixed-size fields.
- Endianness matters for multi-byte integers; you can specify explicitly with `<` (little-endian) or `>` (big-endian).
So ```<SSS>SS``` would be 3x little endian uint16_t and 2x big endian uint16_t.