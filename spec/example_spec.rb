class Person

  class AddressType < ActiveType
    validate :city, presence: true

    def line
      "#{city} #{street}"
    end
  end

  embed :address, class_name: 'Person::AddressType'
  embed_many :additional_addresses, class_name: 'Person::AddressType'
end

describe ActiveType do

  it "should work" do

    person = Person.new(name: 'nicola',
			address: {
      city: 'Leningrad',
      street: 'pr. Lenina'
    })

    person.address.city.should == 'Leningrad'
    person.address.street.should == 'pr. Lenina'
  end
end
