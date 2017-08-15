require 'rails_helper'

describe Contact do
  # 名前とメールアドレスと内容があれば有効な状態であること
  it "is valid with all contents" do
    contact = Contact.new(name: 'AAA', email: 'abc@dfg.co.jp', content: '暑いです')
    expect(contact).to be_valid
  end

  #内容がなければ無効であること
    it "is invalid without any contents" do
      contact = Contact.new
      expect(contact).not_to be_valid
    end

    #名前がなければ無効であること
    it "is valid with name" do
      contact = Contact.new
      contact.valid?
      expect(contact.errors[:name]).to include("を入力してください")
    end

    it "is valid with e-mail" do
      contact = Contact.new
      contact.valid?
      expect(contact.errors[:email]).to include("を入力してください")
    end

    it "is valid with content" do
      contact = Contact.new
      contact.valid?
      expect(contact.errors[:content]).to include("を入力してください")
    end
end
