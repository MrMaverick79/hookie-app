console.log('Mic check');

//Shows the form to enter a new hook on the index page
const showHidden = () => {
    console.log("Clicked!");
    $('.add_new_hook').toggle()
};


//reveals the user menu to edit and logout
//TODO toggle takes params
const showUserMenu = () => {
    console.log('Clicked');
    $('.hidden_user_menu').toggle()
}; 