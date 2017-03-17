class Contact < ApplicationRecord
  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def japanese_number
    "+81 #{phone_number}"
  end

  def self.search(name)
    contacts_last_name = Contact.where(last_name: name)
    contacts_first_name = Contact.where(first_name: name)
    if contacts_first_name.size == 0 or contacts_first_name.size == nil
      return contacts_last_name
    else
      return contacts_first_name
    end
  end

end
