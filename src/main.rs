mod quote;
use quote::fetch_random_quote;
use std::error::Error;

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    let quote = fetch_random_quote().await?;
    quote.print();
    Ok(())
}
