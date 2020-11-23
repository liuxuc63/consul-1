require "rails_helper"

describe SDG::LocalTarget do
  describe "Concerns" do
    it_behaves_like "globalizable", :sdg_local_target
  end

  it "is valid" do
    target = SDG::Target.find_by(code: "1.1")

    expect(build(:sdg_local_target, code: "1.1.1", target: target)).to be_valid
  end

  it "is not valid without a code" do
    target = SDG::Target.find_by(code: "1.1")

    expect(build(:sdg_local_target, code: nil, target: target)).not_to be_valid
  end

  it "is not valid without a target" do
    expect(build(:sdg_local_target, target: nil)).not_to be_valid
  end

  it "is not valid if code is not unique" do
    target = SDG::Target.find_by(code: "1.1")
    create(:sdg_local_target, code: "1.1.1", target: target)
    local_target = build(:sdg_local_target, code: "1.1.1", target: target)

    expect(local_target).not_to be_valid
    expect(local_target.errors.full_messages).to include "Code has already been taken"
  end

  it "#goal returns the target goal" do
    target = SDG::Target.find_by(code: "1.1")
    local_target = create(:sdg_local_target, code: "1.1.1", target: target)

    expect(local_target.goal).to eq(target.goal)
  end
end
