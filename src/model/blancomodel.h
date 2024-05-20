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

    QString wordCallingState() const;
    void setWordCallingState(const QString &newWordCallingState);

    QString debateState() const;
    void setDebateState(const QString &newDebateState);

    int debateIndexPressed() const;
    void setDebateIndexPressed(int newDebateIndexPressed);

    int numberOfBlancos() const;
    void setNumberOfBlancos(int newNumberOfBlancos);

private:
    QStringList mPlayers{""};
    QStringList mWordList{""};
    QString mBlancoState{"AddPlayers"};
    QString mNextButtonTextValue{"lorem"};
    QColor mNextButtonColor{"#000000"};
    QString mWordAssignState{"player"};
    QString mWordCallingState{"preparation"};
    QString mDebateState{"countdown"};
    int mWordAndPlayerIt{0};
    int mDebateIndexPressed{-1};
    int mNumberOfBlancos{1};

    Q_PROPERTY(QStringList players READ players WRITE setPlayers NOTIFY playersChanged FINAL)
    Q_PROPERTY(QString blancoState READ blancoState WRITE setBlancoState NOTIFY blancoStateChanged FINAL)
    Q_PROPERTY(QString nextButtonTextValue READ nextButtonTextValue WRITE setNextButtonTextValue NOTIFY nextButtonTextValueChanged FINAL)
    Q_PROPERTY(QColor nextButtonColor READ nextButtonColor WRITE setNextButtonColor NOTIFY nextButtonColorChanged FINAL)
    Q_PROPERTY(QString wordAssignState READ wordAssignState WRITE setWordAssignState NOTIFY wordAssignStateChanged FINAL)
    Q_PROPERTY(int wordAndPlayerIt READ wordAndPlayerIt WRITE setWordAndPlayerIt NOTIFY wordAndPlayerItChanged FINAL)
    Q_PROPERTY(QStringList wordList READ wordList WRITE setWordList NOTIFY wordListChanged FINAL)
    Q_PROPERTY(QString wordCallingState READ wordCallingState WRITE setWordCallingState NOTIFY wordCallingStateChanged FINAL)
    Q_PROPERTY(QString debateState READ debateState WRITE setDebateState NOTIFY debateStateChanged FINAL)
    Q_PROPERTY(int debateIndexPressed READ debateIndexPressed WRITE setDebateIndexPressed NOTIFY debateIndexPressedChanged FINAL)
    Q_PROPERTY(int numberOfBlancos READ numberOfBlancos WRITE setNumberOfBlancos NOTIFY numberOfBlancosChanged FINAL)

signals:
    void playersChanged();
    void blancoStateChanged();
    void nextButtonTextValueChanged();
    void nextButtonColorChanged();
    void wordAssignStateChanged();
    void wordAndPlayerItChanged();
    void wordListChanged();
    void wordCallingStateChanged();
    void debateStateChanged();
    void debateIndexPressedChanged();
    void numberOfBlancosChanged();
};

#endif // BLANCOMODEL_H
