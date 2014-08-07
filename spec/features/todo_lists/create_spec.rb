require 'spec_helper'

describe "Creating todo lists" do
	def create_todo_list(options={})
		options[:title] ||= "My todo list"
		options[:description] ||= "This is my todo list"

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button "Create Todo list"
	end
	it "redirects to the todo list index page on success" do
		create_todo_list
			expect(page).to have_content("My todo list")
	end

	it "display an error when the todo list has no title" do
		expect(TodoList.count).to eq(0)

		create_todo_list title:""
		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is what I'm doing today.")
	end

	it "display an error when the todo list has a title less then 3 characters" do
		expect(TodoList.count).to eq(0)

		create_todo_list title:"Hi", Desciption:"This is what I'm doing today"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is what I'm doing today.")
	end

	it "display an error when the todo list has a describe" do
		expect(TodoList.count).to eq(0)
		# calling the method
		create_todo_list title:"Grocery list", description:""

    expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Grocery list")
	end
	it "display an error when the todo list has a describe" do
		expect(TodoList.count).to eq(0)

		create_todo_list title:"Grocery list", description:"Food"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("Grocery list")
	end
end

# we have made a method called create_todo_list so we dont have to repeat the code each timevisit "/todo_lists"
# visit "/todo_lists"
# click_link "New Todo list"
# expect(page).to have_content("New todo_list")
#
# fill_in "Title", with: "Grocery list"
# fill_in "Description", with: "Food"
# click_button "Create Todo list"
