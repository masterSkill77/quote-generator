use clap::{Arg, Command};
pub fn cli() -> Command<'static> {
    Command::new("quote-generator")
        .author("Clairmont RAJAONARISON")
        .about("A quote random generator, used to motivate you in some case 🙏🙏🙏")
        .arg(author_arg())
}

fn author_arg() -> Arg<'static> {
    Arg::new("author")
        .short('a')
        .long("author")
        .help("Print the author of this CLI")
        .required(false)
        .takes_value(false)
}

pub fn print_author() {
    println!("The author of this CLI is Clairmont RAJAONARISON, software enginner")
}
