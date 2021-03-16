class Inquiry < ApplicationRecord
enum subject: {"Life Hack Noteに関するお問合わせ": 0,"Life Hack Note上の不適切なコンテンツを報告する": 1, "広告に関するお問い合わせ": 2 }


end
