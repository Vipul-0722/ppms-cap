using CatalogService as service from '../../srv/cat-service';
annotate service.Books with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'stock',
        },
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'title',
        },
        {
            $Type : 'UI.DataField',
            Value : author.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : author.name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : author.books.author_ID,
            Label : 'author_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : author.books.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : author.books.title,
            Label : 'title',
        },
        {
            $Type : 'UI.DataField',
            Value : author.books.stock,
            Label : 'stock',
        },
        {
            $Type : 'UI.DataField',
            Value : author.books.author.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : author.books.author.name,
            Label : 'name',
        },
    ]
);

