class KicadComponent < ActiveRecord::Base
  #attr_accessor :name
  attr_accessor :housing
  attr_accessor :count
  attr_accessor :assign

  belongs_to  :kicad_housing
  belongs_to  :component

  validates_presence_of     :name
  validates_numericality_of :kicad_housing_id
  validates_numericality_of :component_id

  def read( path )
    kicad_components = Hash.new

    if File.exist?( path )
      file = File.open( path )
      name = String.new
      housing = String.new
      is_cmp = false
      file.read.each_line do |line|
        case line[0,3]
          when "Beg"
            name = ""
            housing = ""
            is_cmp = true

          when "Val"
            if is_cmp
              name = line.split("=")[1].delete( ";" ).strip
            end

          when "IdM"
            if is_cmp
              housing = line.split("=")[1].delete( ";" ).strip
            end

          when "End"
            if is_cmp
              if kicad_components[name + housing]
                kicad_components[name + housing].count += 1
              else
                kc = KicadComponent.new
                kc.name = name
                kc.housing = housing
                kc.count = 1
                kicad_components[name + housing] = kc
              end
            end
            is_cmp = false
        end
      end
      file.close
    end

    kicad_components
  end
end
