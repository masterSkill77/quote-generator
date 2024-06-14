mod quote;
use quote::Quote;
use std::error::Error;

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    let quote = reqwest::get("https://dummyjson.com/quotes/random")
        .await?
        .json::<Quote>()
        .await?;
    quote.print();
    Ok(())
}
