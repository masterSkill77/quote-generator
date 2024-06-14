use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct Quote {
    pub id: u32,
    pub quote: String,
    pub author: String,
}

impl Quote {
    pub fn print(self: &Quote) {
        println!("{} - {}", self.quote, self.author)
    }
}
