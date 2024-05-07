#ifndef BLANCOMODEL_H
#define BLANCOMODEL_H

#include <QObject>
#include "gamemodel.h"
#include <QColor>

class BlancoModel : public GameModel
{
    Q_OBJECT

public:
    explicit BlancoModel(GameModel *parent = nullptr);

    void init(QString path);

    QStringList players();
    void setPlayers(const QStringList &newPlayers);

    QString blancoState() const;
    void setBlancoState(const QString &newBlancoState);

    QString nextButtonTextValue() const;
    void setNextButtonTextValue(const QString &newNextButtonTextValue);

    QColor nextButtonColor() const;
    void setNextButtonColor(const QColor &newNextButtonColor);

    QString wordAssignState() const;
    void setWordAssignState(const QString &newWordAssignState);

    int wordAndPlayerIt() const;
    void setWordAndPlayerIt(int newWordAndPlayerIt);

    QStringList wordList() const;
    void setWordList(const QStringList &newWordList);

private:
    QStringList mPlayers{""};
    QStringList mWordList{""};
    QString mBlancoState{"AddPlayers"};
    QString mNextButtonTextValue{"lorem"};
    QColor mNextButtonColor{"#000000"};
    QString mWordAssignState{"player"};
    int mWordAndPlayerIt{0};

    Q_PROPERTY(QStringList players READ players WRITE setPlayers NOTIFY playersChanged FINAL)
    Q_PROPERTY(QString blancoState READ blancoState WRITE setBlancoState NOTIFY blancoStateChanged FINAL)
    Q_PROPERTY(QString nextButtonTextValue READ nextButtonTextValue WRITE setNextButtonTextValue NOTIFY nextButtonTextValueChanged FINAL)
    Q_PROPERTY(QColor nextButtonColor READ nextButtonColor WRITE setNextButtonColor NOTIFY nextButtonColorChanged FINAL)
    Q_PROPERTY(QString wordAssignState READ wordAssignState WRITE setWordAssignState NOTIFY wordAssignStateChanged FINAL)
    Q_PROPERTY(int wordAndPlayerIt READ wordAndPlayerIt WRITE setWordAndPlayerIt NOTIFY wordAndPlayerItChanged FINAL)
    Q_PROPERTY(QStringList wordList READ wordList WRITE setWordList NOTIFY wordListChanged FINAL)

signals:
    void playersChanged();
    void blancoStateChanged();
    void nextButtonTextValueChanged();
    void nextButtonColorChanged();
    void wordAssignStateChanged();
    void wordAndPlayerItChanged();
    void wordListChanged();
};

#endif // BLANCOMODEL_H
