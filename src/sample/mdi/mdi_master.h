#ifndef MDI_MASTER_H
#define MDI_MASTER_H

#include <QMainWindow>

class MdiChild;
QT_BEGIN_NAMESPACE
class QAction;
class QMenu;
class QMdiArea;
class QMdiSubWindow;
class QSignalMapper;
QT_END_NAMESPACE

namespace Ui {
class MdiMaster;
}

class MdiMaster : public QMainWindow
{
    Q_OBJECT

public:
    explicit MdiMaster(QWidget *parent = 0);
    ~MdiMaster();

protected:
    void closeEvent(QCloseEvent *event) Q_DECL_OVERRIDE;

private slots:
    void newChild();
    void about();
    void updateMenus();
    void updateWindowMenu();
    void switchLayoutDirection();
    void setActiveSubWindow(QWidget *window);
    void test1();

private:
    void createActions();
    void createMenus();
    void createStatusBar();
    void readSettings();
    void writeSettings();
    MdiChild *createMdiChild();
    MdiChild *activeMdiChild();
    QMdiSubWindow *findMdiChild(const QString &fileName);

    Ui::MdiMaster *ui;

    QMdiArea *mdiArea;
    QSignalMapper *windowMapper;

    QMenu *windowMenu;
    QMenu *helpMenu;

    QAction *newAct;

    QAction *closeAct;
    QAction *closeAllAct;
    QAction *tileAct;
    QAction *cascadeAct;
    QAction *nextAct;
    QAction *previousAct;
    QAction *separatorAct;

    QAction *aboutAct;
    QAction *test1Act;

};

#endif // MDI_MASTER_H
