use tokio::net;
use std::io;

#[tokio::main]
async fn main() -> io::Result<()> {
    for addr in net::lookup_host("localhost:3000").await? {
        println!("socket address is {}", addr);
    }
    Ok(())

}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn assert_no_errors() {
        let result = main();
        match result {
            Ok(v) => v,
            Err(e) => {
                panic!("{}", e);
            }
        }
    }
}
