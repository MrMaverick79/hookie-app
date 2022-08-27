# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#### Link Seeds ####
#### Url / Image will use Nokogiri ###

Link.destroy_all

l1 = Link.create!(
    name: "Slack",
    url: "https://app.slack.com/client/",
    notes: 'Our Slack homepage for SEI 2055',
    nsfw: false,

    
)
l2 = Link.create!(
    name: "Github",
    url: "https://github.com/",
    notes: 'The GitHub home page',
    nsfw: false,
)

l3 = Link.create!(
    name: "Nokiogiri Docs",
    url: "https://nokogiri.org",
    notes: 'This can be used to parse HTML, hopefully to find the favicomn.ico',
    nsfw: false,
    
)
l4 = Link.create!(
    name: "Reddit",
    url: "https://reddit.com",
    notes: 'Made this NSFW for testing',
    nsfw: true,
    
)

l5 = Link.create!(
    name: "Arch Linux Wiki",
    url: "https://wiki.archlinux.org",
    notes: 'Lots fo good information about Arch Linux',
    nsfw: false,
    
)
puts "###########CREATING LINKS############"
puts "I have created #{Link.count} links."
puts "The names of the links I have created are: #{Link.pluck(:name).join(', ')}."



##### HOOK SEEDS #########




###### TAG  SEEDS #######

Tag.destroy_all

t1 = Tag.create!(
    name: "tech"

)
t2 = Tag.create!(
    name: "home"

)
t3 = Tag.create!(
    name: "recipe"

)
t4 = Tag.create!(
    name: "personal"

)
t5 = Tag.create!(
    name: "fun"

)

puts "###########CREATING TAGS############"
puts "I have created #{Tag.count} tags."
puts "The names of the tags I have created are: #{Tag.pluck(:name).join(', ')}."


### Forming Connections (Links --< >---Tags)
l1.tags << t1 << t2
l2.tags << t1 << t4 << t5
l3.tags << t3

puts "#####Testing connections links--<>--tags#####"
puts"The link '#{l1.name}' contains the links: #{l1.tags.pluck(:name).join(', ')}."
puts"The link '#{l2.name}' contains the links: #{l2.tags.pluck(:name).join(', ')}."
puts"The link '#{l3.name}' contains the links: #{l3.tags.pluck(:name).join(', ')}."


########## USER SEEDS ##########

User.destroy_all

u1 = User.create!(

    name: 'Pancho Villa',
    email: 'lavillaloco@alo.com',
    password: 'chicken',
    image: 'https://joeschmoe.io/api/v1/random'


)

u2 = User.create!(

    name: 'Don Quixote De La Mancha',
    email: 'windmilltilter@alo.com',
    password: 'chicken',
    image: 'https://joeschmoe.io/api/v1/random'


)


u3 = User.create!(
    name: 'Rob Roy',
    email: 'themadscot@groopa.com',
    password: 'chicken',
    image: 'https://joeschmoe.io/api/v1/random'


)

puts "###########CREATING USER############"
puts "I have created #{User.count} users."
puts "The names of the users I have created are: #{User.pluck(:name).join(', ')}."

Hook.destroy_all

h1 = Hook.create!(
    title: "Web Development Links",
    note: "Resources for web development projects",
    color: 'red',
    private: false,
    user_id: u1.id

)

h2 = Hook.create!(
    title: "Recipes for guests",
    note: "For when I have to cook something special",
    color: 'blue',
    private: false,
    user_id: u1.id

)

h3 = Hook.create!(
    title: "Time-wasters",
    note: "A bunch of fun and distracting stuff",
    color: 'gold',
    private: true,
    user_id: u2.id

)



puts "###########CREATING HOOKS############"
puts "I have created #{Hook.count} hooks."
puts "The names of the links I have created are: #{Hook.pluck(:title).join(', ')}."


##### Associations ######

puts "Forming strong bonds..."

h1.links << l1
h2.links << l1 <<l3
h3.links << l3 << l4 <<l5 <<l2

puts "#####Testing connections hooks--<>--links#####"
puts"The hook '#{h1.title}' contains the links: #{h1.links.pluck(:name).join(', ')}."
puts"The hook '#{h2.title}' contains the links: #{h2.links.pluck(:name).join(', ')}."
puts"The hook '#{h3.title}' contains the links: #{h3.links.pluck(:name).join(', ')}."



###### Associations  - one to any User--< Hook ######


puts "##### Checking Association User--< Hooks"
puts "The hook: #{h3.title} is owned by #{h3.user.name}."
puts "The user #{u1.name} owns the following hooks: #{u1.hooks.pluck(:title).join(", ")}."