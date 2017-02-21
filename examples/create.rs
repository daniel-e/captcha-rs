use std::io::{stdout, Write};

extern crate captcha;
use captcha::{init, done, CharConfig, captcha_png};

fn main() {
    init();

    let cc = CharConfig {
        min_angle: -20.0,
        max_angle: 20.0,
        min_size: 50,
        max_size: 80,
        colors: vec!["black".to_string()],
        fonts: vec!["Verdana-Bold-Italic".to_string()]
    };

    let solution = "abcdef";

    match captcha_png(solution, &cc) {
        Ok(png) => {
            let _ = stdout().write(&png[..]);
        },
        _ => { panic!("Generation failed."); }
    }

    done();
}
