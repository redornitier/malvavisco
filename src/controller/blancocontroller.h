#ifndef BLANCOCONTROLLER_H
#define BLANCOCONTROLLER_H

#include <QObject>
#include <QQmlEngine>
class BlancoModel;

class BlancoController : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit BlancoController(QObject *parent = nullptr);

    void calculateWord();
    void distributePlayers();
    void shufflePlayers();
    void calculateCurrentPlayerAndWord();

    void setModel(BlancoModel *blancoModel);

    Q_INVOKABLE void nextButtonClick();
    Q_INVOKABLE void changePlayerNameByIndex(int index, QString value);
    Q_INVOKABLE void removePlayerByIndex(int index);
    Q_INVOKABLE void addPlayerIndex();
private:
    BlancoModel *mBlancoModel;
    QStringList mTemporalPlayers{""};

};

#endif // BLANCOCONTROLLER_H
