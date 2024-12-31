10.times do |blog|
  Blog.create!(
    title: "My Blog No. #{blog}",
    body: "Hello world. I am here doing ror work"
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

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio Item No. #{portfolio_item}",
    subtitle: "xyz",
    body: "lalalallalaalalallaallalallallala",
    main_image: "https://placehold.co/600x400",
    thumb_image: "https://placehold.co/300x200",
  )
end

puts "portfolio items created"
