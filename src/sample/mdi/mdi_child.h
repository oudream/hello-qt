#ifndef MDI_CHILD_H
#define MDI_CHILD_H

#include <QDialog>

namespace Ui {
class MdiChild;
}

class MdiChild : public QDialog
{
    Q_OBJECT

public:
    explicit MdiChild(QWidget *parent = 0);
    ~MdiChild();

    QString getId() { return _id; }

private:    
    Ui::MdiChild *ui;

    QString _id;

};

#endif // MDI_CHILD_H
