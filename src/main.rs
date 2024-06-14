mod cli;
mod quote;

use cli::{cli, print_author};
use quote::fetch_random_quote;
use std::error::Error;

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    let args = cli().get_matches();
    if !args.args_present() {
        let quote = fetch_random_quote().await?;
        quote.print();
    }
    if args.is_present("author") {
        print_author();
    }

    Ok(())
}
