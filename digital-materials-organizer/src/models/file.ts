import { Schema, model } from 'mongoose';

const fileSchema = new Schema({
    title: {
        type: String,
        required: true,
    },
    type: {
        type: String,
        enum: ['PDF', 'DOCX', 'PPT', 'IMAGE', 'VIDEO', 'LINK'],
        required: true,
    },
    size: {
        type: Number,
        required: true,
    },
    uploadedBy: {
        type: Schema.Types.ObjectId,
        ref: 'User',
        required: true,
    },
    subject: {
        type: String,
        required: true,
    },
    topic: {
        type: String,
        required: true,
    },
    createdAt: {
        type: Date,
        default: Date.now,
    },
    updatedAt: {
        type: Date,
        default: Date.now,
    },
});

export const File = model('File', fileSchema);