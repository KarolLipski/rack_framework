class AddSomePosts < Sequel::Migration
  def up
    Post.insert(
      title: 'What is Lorem Ipsum?',
      content: 'Lorem Ipsum is a dummy text...'
    )
    Post.insert(
      title: 'Why do we use it?',
      content: 'It is a long established fact that a reader...'
    )
    Post.insert(
      title: 'Where does it come from?',
      content: 'Contrary to popular belief, Lorem Ipsum is not simply...'
    )
  end

  def down
  end
end