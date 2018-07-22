include RSpec

require_relative 'node'
require_relative 'find_kevin_bacon'

RSpec.describe Node, type: Class do
  let(:kevin_bacon) { Node.new("Kevin Bacon") }
  let(:john_lithgow) { Node.new("John Lithgow") }
  let(:chris_penn) { Node.new("Chris Penn") }
  let(:sarah_jess_parker) { Node.new("Sarah Jessica Parker") }
  let(:michael_fassbender) { Node.new("Michael Fassbender") }
  let(:jennifer_lawrence) { Node.new("Jennifer Lawrence") }
  let(:zoe_kravitz) { Node.new("Zoe Kravitz") }
  let(:james_mcavoy) { Node.new("James McAvoy") }
  let(:matthew_mcconaughey) { Node.new("Matthew McConaughey") }
  let(:anne_hathaway) { Node.new("Anne Hathaway") }
  let(:jessica_chastain) { Node.new("Jessica Chastain") }
  let(:leonardo_dicaprio) { Node.new("Leonardo DiCaprio") }
  let(:jonah_hill) { Node.new("Jonah Hill") }
  let(:margot_robbie) { Node.new("Margot Robbie") }

  before do
    # Setup movie arrays of actor nodes
    footloose = [kevin_bacon, john_lithgow, chris_penn, sarah_jess_parker]
    xmen_first_class = [james_mcavoy, michael_fassbender, kevin_bacon, jennifer_lawrence, zoe_kravitz]
    interstellar = [matthew_mcconaughey, jessica_chastain, john_lithgow, anne_hathaway]
    wolf_of_wall_street = [leonardo_dicaprio, jonah_hill, margot_robbie, matthew_mcconaughey]

    # Assign actor nodes the movie arrays they belong to
    kevin_bacon.film_actor_hash["Footloose"] = footloose
    john_lithgow.film_actor_hash["Footloose"] = footloose
    chris_penn.film_actor_hash["Footloose"] = footloose
    sarah_jess_parker.film_actor_hash["Footloose"] = footloose

    james_mcavoy.film_actor_hash["X-Men: First Class"] = xmen_first_class
    michael_fassbender.film_actor_hash["X-Men: First Class"] = xmen_first_class
    kevin_bacon.film_actor_hash["X-Men: First Class"] = xmen_first_class
    jennifer_lawrence.film_actor_hash["X-Men: First Class"] = xmen_first_class
    zoe_kravitz.film_actor_hash["X-Men: First Class"] = xmen_first_class

    matthew_mcconaughey.film_actor_hash["Interstellar"] = interstellar
    jessica_chastain.film_actor_hash["Interstellar"] = interstellar
    john_lithgow.film_actor_hash["Interstellar"] = interstellar
    anne_hathaway.film_actor_hash["Interstellar"] = interstellar

    leonardo_dicaprio.film_actor_hash["The Wolf of Wall Street"] = wolf_of_wall_street
    jonah_hill.film_actor_hash["The Wolf of Wall Street"] = wolf_of_wall_street
    margot_robbie.film_actor_hash["The Wolf of Wall Street"] = wolf_of_wall_street
    matthew_mcconaughey.film_actor_hash["The Wolf of Wall Street"] = wolf_of_wall_street
  end

  describe "find_kevin_bacon" do
    it "finds the actor's connection to Kevin Bacon in under 7 mutual connections (1)" do
      expect(find_kevin_bacon(leonardo_dicaprio)).to eq(["The Wolf of Wall Street", "Interstellar", "Footloose"])
    end

    it "finds the actor's connection to Kevin Bacon in under 7 mutual connections (2)" do
      expect(find_kevin_bacon(michael_fassbender)).to eq(["X-Men: First Class"])
    end
  end

end
