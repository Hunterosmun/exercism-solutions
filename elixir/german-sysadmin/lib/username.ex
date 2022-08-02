defmodule Username do
  def sanitize(username) do
    # a is 97
    # z is 122
    username
      |> Enum.flat_map(fn l -> 
        case l do
          ?ä -> 'ae'  
          ?ö -> 'oe'
          ?ü -> 'ue'
          ?ß -> 'ss'
          ?_ -> '_'
          l when l in ?a..?z -> [l]
          _ -> ''
        end
        # ?l >= 97 || ?l <= 122  used this for first run through (using filter)
        # l when ?l >= 97 or ?l <= 122 -> l
        # l when l >= ?a and l <= ?z -> [l]
      end)
    # second, change that to everything but lowercase & underscore
    # last, change it so that if symbols are the same as below: we replace it
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
  end
end
