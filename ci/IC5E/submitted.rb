# Given an org-chart denoted as a string in the following format:
# "id:name:manager_id,id:name:manager_id"
# Ex.
# "1:Max:4,2:Ann:0,3:Albert:2,4:Edmond:2"
# Print out an orgchart in simple ascii

# For the example above print out the following:
#
# Ann
# - Albert
# - Edmond
# -- Max


# "id:name:manager_id,id:name:manager_id"
# "1:Max:4,2:Ann:0,3:Albert:2,4:Edmond:2"

<<-SANDBOXING
  1, Max, 4
  2, Ann, 0
  3, Alebert, 2
  4, Edmond, 2

  Ann
  - Albert
  - Edmond
  -- Max

  TREE
  parent
  children

  class Node
    attr_accesor :children, :parent
  end


SANDBOXING


class Person

  attr_accessor :id,
                :name,
                :manager_id,
                :employees

  @@people_map = {
  }

  def initialize(id:,name:,manager_id:)
    @id = id
    @name = name
    @manager_id = manager_id
    @employees = []
    @@people_map[id] = self
  end

  def self.assign_employees!(people)
    people.each do |person|
      unless person.manager_id == "0"
        manager = Person.find(person.manager_id)
        manager.employees << person
      end
    end
  end

  def self.find(id)
    @@people_map[id]
  end

end

def print_org_chart(csv_values)
  def helper(person,position)
    if position == 0
      puts "#{person.name}"
    else
      position_prefix = "-" * position
      puts "#{position_prefix} #{person.name}"
    end
    person.employees.each do |person|
      helper(person,position+1)
    end
  end
  top_level_person = build_people(csv_values)
  helper(top_level_person,0)
end

def build_people(csv_values)
  people = []
  top_level_person = nil
  csv_values.split(",").each do |row|
    id, name, manager_id = row.split(":")
    person = Person.new(id: id, name: name, manager_id: manager_id)
    people << person
    if manager_id == "0"
      top_level_person = person
    end
  end
  Person.assign_employees!(people)
  top_level_person
end

print_org_chart("1:Max:4,2:Ann:0,3:Albert:2,4:Edmond:2")



