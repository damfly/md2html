require 'tilt'
require 'yaml'

dirname = File.dirname(__FILE__)
template = Tilt['haml'].new("#{dirname}/ayudo.haml")
data = Tilt['md'].new("#{dirname}/document.md")
yamlpart = File.read("#{dirname}/document.md")[/^-+(.*?)^-+/m].delete('---').strip

@page = yamlpart.to_yaml

File.open("#{dirname}/coucou3.html", 'w') do |f|
  f.write(template.render(self, :page => YAML.parse(yamlpart)) { data.render })
end


