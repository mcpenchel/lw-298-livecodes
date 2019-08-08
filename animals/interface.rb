require_relative 'lion'
require_relative 'meerkat'
require_relative 'warthog'

simba = Lion.new("Simba")
nala = Lion.new("Nala")
pumbaa = Warthog.new("Pumbaa")
timon = Meerkat.new("Timon")

my_jungle = [
  simba, nala, pumbaa, timon
]

my_jungle.each do |animal|
  puts animal.talk
end
