include RSpec

require_relative 'min_binary_heap.rb'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { MinBinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      tree.insert(root, district)
      expect(root.left.title).to eq "District 9"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(root, district)
      tree.insert(root, martian)
      expect(root.right.title).to eq "The Martian"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(root, district)
      tree.insert(root, martian)
      tree.insert(root, hope)
      expect(root.left.left.title).to eq "Star Wars: A New Hope"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(root, district)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.insert(root, shawshank)
      expect(root.left.right.title).to eq "The Shawshank Redemption"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, district)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.insert(root, shawshank)
      tree.insert(root, empire)
      expect(root.right.left.title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(root, district)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.insert(root, shawshank)
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(root.right.right.title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly replaces the root with a new absolute minimum (1)" do
      tree.insert(root, pacific_rim)
      expect(tree.root.title).to eq "Pacific Rim"
      expect(tree.root.left.title).to eq "The Matrix"
      expect(tree.root.left.left).to be nil
      expect(tree.root.left.right).to be nil
    end

    it "properly replaces the root with a new absolute minimum (2)" do
      tree.insert(root, district)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.insert(root, pacific_rim)
      expect(tree.root.title).to eq "Pacific Rim"
      expect(tree.root.left.title).to eq "The Matrix"
      expect(tree.root.left.left.title).to eq "Star Wars: A New Hope"
      expect(tree.root.left.right.title).to eq "District 9"
      expect(tree.root.right.title).to eq "The Martian"
      expect(tree.root.left.right.left).to be nil
      expect(tree.root.left.right.right).to be nil
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, empire)
      expect(tree.find(root, empire.title).title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "properly finds a right node" do
      tree.insert(root, empire)
      tree.insert(root, district)
      expect(tree.find(root, district.title).title).to eq "District 9"
    end

    it "properly finds a left-left node" do
      tree.insert(root, shawshank)
      tree.insert(root, district)
      tree.insert(root, martian)
      expect(tree.find(root, martian.title).title).to eq "The Martian"
    end

    it "properly finds a left-right node" do
      tree.insert(root, shawshank)
      tree.insert(root, district)
      tree.insert(root, martian)
      tree.insert(root, hope)
      expect(tree.find(root, hope.title).title).to eq "Star Wars: A New Hope"
    end

    it "properly finds a right-left node" do
      tree.insert(root, shawshank)
      tree.insert(root, district)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.insert(root, empire)
      expect(tree.find(root, empire.title).title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "properly finds a right-right node" do
      tree.insert(root, shawshank)
      tree.insert(root, district)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect(tree.find(root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to be_nil
    end

    it "properly deletes a left node" do
      tree.insert(tree.root, district)
      tree.delete(tree.root, district.title)
      expect(tree.find(tree.root, district.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.delete(tree.root, shawshank.title)
      expect(tree.find(tree.root, shawshank.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.delete(tree.root, martian.title)
      expect(tree.find(tree.root, martian.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert(root, district)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.insert(root, shawshank)
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      tree.delete(root, mad_max_2.title)
      expect(tree.find(tree.root, mad_max_2.title)).to be_nil
    end

    it "properly replaces deleted roots with the new absolute minumum" do
      tree.insert(tree.root, martian)
      tree.insert(tree.root, district)
      tree.delete(tree.root, root.title)
      expect(tree.find(tree.root, root.title)).to be_nil
    end

    it "properly reorganizes the heap after the root is deleted" do
      tree.insert(tree.root, district)
      tree.insert(tree.root, martian)
      tree.delete(tree.root, root.title)
      expect(tree.find(tree.root, root.title)).to be_nil
      expect(tree.root.title).to eq "District 9"
      expect(tree.root.left.title).to eq "The Martian"
    end
  end

  describe "#printf" do
    specify {
      expected_output = "The Matrix: 87\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
      tree.insert(root, district)
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.insert(root, empire)
      tree.insert(root, mad_max_2)
      expect { tree.printf }.to output(expected_output).to_stdout
    }
  end
end
