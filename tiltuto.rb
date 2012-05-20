require 'tilt'
require 'yaml'
#Get the directory where the files are 
dirname = File.dirname(__FILE__)

#Get the template
template = Tilt['haml'].new("#{dirname}/ayudo.haml")

#Get the yaml part of the markdown document
yamlpart = File.read("#{dirname}/document.md")[/^-+(.*?)^-+/m].delete('---').strip

#Get the markdown part of the mardown document
mdpart = File.read("#{dirname}/document.md").gsub(/^-+(.*?)-+/m, "")

#let's give the markdown part of the document to TILT
File.open("#{dirname}/temp.md", 'w') {|f| f.write(mdpart) }
data = Tilt['md'].new("#{dirname}/temp.md")
File.delete("#{dirname}/temp.md")

#Render the data within the template
File.open("#{dirname}/res.html", 'w') do |f|
  f.write(template.render(self, :page => YAML.load(yamlpart)) { data.render })
end




