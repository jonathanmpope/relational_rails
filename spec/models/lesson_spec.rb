require 'rails_helper'

RSpec.describe Lesson, type: :model do 
    describe 'relationships' do 

    end 

    describe 'validations' do
        it { should validate_presence_of :name}
        it { should validate_presence_of :format}
        it { should validate_presence_of :questions}
    end 

    describe 'instance methods' do 
			
    end 

end 
