3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts "Topics created0"

10.times do |blog|
  Blog.create!(
    title: "My Blog No. #{blog}",
    body: "Hello world. I am here doing ror work",
    topic_id: Topic.last.id
  )
end

puts "blogs created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: skill*10
  )
end

puts "skills created"

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio Item No. #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "lalalallalaalalallaallalallallala",
    main_image: "https://placehold.co/600x400",
    thumb_image: "https://placehold.co/300x200",
  )
end
1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio Item No. #{portfolio_item}",
    subtitle: "React",
    body: "lalalallalaalalallaallalallallala",
    main_image: "https://placehold.co/600x400",
    thumb_image: "https://placehold.co/300x200",
  )
end

puts "portfolio items created"
