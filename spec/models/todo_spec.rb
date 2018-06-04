require "rails_helper"
describe Todo do
  describe "#create" do
    it "is valid with content" do
      todo = build(:todo)
      expect(todo).to be_valid
    end

    it "is invalid with content" do
      todo = build(:todo, content: nil)
      todo.valid?
      expect(todo.errors[:content]).to include("can't be blank")
    end
  end
end

