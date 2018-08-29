#ifndef MDI_WIN_H
#define MDI_WIN_H

#include <QDialog>

namespace Ui {
class MdiWin;
}

class MdiWin : public QDialog
{
    Q_OBJECT

public:
    explicit MdiWin(QWidget *parent = 0);
    ~MdiWin();

private:
    Ui::MdiWin *ui;
};

#endif // MDI_WIN_H
