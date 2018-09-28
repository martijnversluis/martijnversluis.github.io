module TimelineHelpers
  def pastel_colour(input_str)
    base_red = 128
    base_green = 128
    base_blue = 128

    seed = input_str[0].ord ^ input_str[1].ord
    rand_1 = (Math.sin(seed+=1) * 10000).abs % 256
    rand_2 = (Math.sin(seed+=1) * 10000).abs % 256
    rand_3 = (Math.sin(seed+=1) * 10000).abs % 256

    red = ((rand_1 + base_red) / 2).round
    green = ((rand_2 + base_green) / 2).round
    blue = ((rand_3 + base_blue) / 2).round

    { red: red, green: green, blue: blue }
    "rgb(#{red}, #{green}, #{blue})"
  end
end
