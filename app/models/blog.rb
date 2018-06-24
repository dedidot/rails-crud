class Blog < ApplicationRecord
    validates :title, presence: {message: "Jangan kosong"}, length: { minimum: 4, message: "Minimal 4 karakter" }
end