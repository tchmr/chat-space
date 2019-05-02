require 'rails_helper.rb'
describe Message do
  describe '#create' do
    context 'can save' do
      it 'is valid with body' do
        msg = build(:message, image: nil)
        expect(msg).to be_valid
      end
      it 'is valid with image' do
        msg = build(:message, body: nil)
        expect(msg).to be_valid
      end
      it 'is valid wit body and image' do
        msg = build(:message)
        expect(msg).to be_valid
      end
    end
    context "can't save" do
      it 'is invalid without body and image' do
        expect(build(:message, body: "", image: "")).not_to be_valid
      end
      it "is invalid without group_id" do
        expect(build(:message, group: nil)).not_to be_valid
      end
      it "is invalid without group_id" do
        expect(build(:message, user: nil)).not_to be_valid
      end
    end
  end
end