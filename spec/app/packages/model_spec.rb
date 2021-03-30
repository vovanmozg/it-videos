describe AppRecord do
  it 'creates instance' do

    class TestModel < AppRecord
      include AppRecord::StoreIn
    end

    model = TestModel.new(name: 'kuku')
    model.save
    expect(model).to be_persisted
  end
end
