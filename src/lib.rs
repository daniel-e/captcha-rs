extern crate rand;
extern crate lodepng;
extern crate libc;

mod image;
mod generator;

pub use image::init_img as init;
pub use image::done_img as done;
pub use generator::CharConfig as CharConfig;
pub use generator::captcha_png as captcha_png;

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
    }
}
