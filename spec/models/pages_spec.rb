describe 'Page' do

  before { @page = Page.new }

  specify "should contain new list" do

    @page.checklists[1].title.should eql('Новый список')
  end
end