describe LinksContainer::Services::Start do
  it 'starts first element from db' do
    item = instance_double(LinksContainer::LinksContainerModel, :start! => nil)
    items = [item]
    allow_any_instance_of(LinksContainer::ReadyToPerformQuery).to receive(:call).and_return(items)
    described_class.new.call
    expect(item).to have_received(:start!)
  end
end
