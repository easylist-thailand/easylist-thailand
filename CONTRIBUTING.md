# Contributing

หากท่านต้องการให้ช่วยบล็อคโฆษณาเว็บไซท์ใด หรือพบปัญหา ณ เว็บไซท์ใด สามารถรายงานมาได้ที่ [Issues](https://github.com/easylist-thailand/easylist-thailand/issues)

ยินดีเป็นอย่างยิ่งสำหรับ Pull Request เพิ่อเพิ่มรายการตัวกรองต่างสำหรับบล็อคโฆษณาเพิ่ม

## Rule for contributing

- กรุณาใช้ [gitmoji-cli](https://github.com/carloscuesta/gitmoji-cli) ในการ commit เพื่อให้ commit message เป็นไปตามรูปแบบของ [Gitmoji](https://gitmoji.carloscuesta.me/)
- Code ทั้งหมดที่แก้ไขต้องผ่านการ analyze ของ [RuboCop](https://github.com/bbatsov/rubocop) เพื่อให้เป็นไปตาม [Ruby coding style guide](https://github.com/bbatsov/ruby-style-guide)

## Development

```bash
# Install gem
bundle install

# Generate subscription file
rake

# Clean subscription file
rake clean
```
