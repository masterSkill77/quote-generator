use std::error::Error;

use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct Quote {
    pub id: u32,
    pub quote: String,
    pub author: String,
}

impl Quote {
    pub fn print(self: &Quote) {
        println!("\"{}\" - {}", self.quote, self.author)
    }
}

pub async fn fetch_random_quote() -> Result<Quote, Box<dyn Error>> {
    let quote = reqwest::get("https://dummyjson.com/quotes/random")
        .await?
        .json::<Quote>()
        .await?;
    Ok(quote)
}
