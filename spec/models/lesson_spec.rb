require 'rails_helper'

RSpec.describe Lesson, type: :model do 
    describe 'relationships' do 
        it { should belong_to :course }
    end 

    describe 'validations' do
        it { should validate_presence_of :name}
        it { should validate_presence_of :format}
        it { should validate_presence_of :questions}
        it { should  allow_value(true).for(:complete)}
    end 

    describe 'instance methods' do 
			
    end 

end 
